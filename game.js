function main(width, height) {
    var canvas = document.getElementById('canvas')
    var ctx = canvas.getContext("2d");
    canvas.setAttribute('width', width)
    canvas.setAttribute('height', height)
    board = new Board(height, width, false, false)
    document.addEventListener('keydown', function(event) {
        board.updateKeyPress(event.keyCode)
    });
    setInterval(function() {
        mainGameLoop(ctx, board, width, height)
    }, 20);
}

function mainGameLoop(ctx, board, width, height, pop) {
    board.updateBall()
    board.updatePucks()
    board.draw(ctx)
}
class Puck {
    constructor(width, height, upKey, downKey, x, y, movSpd) {
        this.width = width
        this.height = height
        this.upKey = upKey
        this.downKey = downKey
        this.x = x
        this.y = y
        this.movSpd = movSpd
    }
    draw(ctx) {
        ctx.fillStyle = "#000000";
        ctx.fillRect(this.x, this.y, this.width, this.height);
    }
    updatePos(key, barriers) {
        if (key == this.upKey) {
            if (this.y - this.movSpd >= barriers[0].y + barriers[0].height) {
                this.y = this.y - this.movSpd;
            }
        } else if (key == this.downKey) {
            if (this.y + this.height + this.movSpd <= barriers[1].y) {
                this.y = this.y + this.movSpd;
            }
        }
    }
}
class AiPuck {
    constructor(width, height, player, x, y, movSpd) {
        this.score = 0
        this.width = width
        this.height = height
        this.player = player
        this.x = x
        this.y = y
        this.movSpd = movSpd
    }
    draw(ctx) {
        ctx.fillStyle = "#000000";
        ctx.fillRect(this.x, this.y, this.width, this.height);
    }
    updatePos(ballpos, barriers) {
        var outputs = this.player.think([Math.abs(this.x - ballpos[0]) / 1000, ballpos[1] / 1000, (this.y + 50) / 1000]);
        if (outputs[0] >= outputs[1] && outputs[0] >= outputs[2]) {
            if (this.y - this.movSpd >= barriers[0].y + barriers[0].height) {
                this.y = this.y - this.movSpd;
            }
        }
        if (outputs[0] < outputs[1] && outputs[1] >= outputs[2]) {
            if (this.y + this.height + this.movSpd <= barriers[1].y) {
                this.y = this.y + this.movSpd;
            }
        }
    }
}
class Barrier {
    constructor(x, y, width, height) {
        this.width = width
        this.height = height
        this.x = x
        this.y = y
    }
    draw(ctx) {
        ctx.fillStyle = "#000000";
        ctx.fillRect(this.x, this.y, this.width, this.height);
    }
}
class Board {
    constructor(height, width, player1, player2) {
        this.height = height
        this.width = width
        this.barrier1 = new Barrier(0, 0, this.width, (this.height / 100) * 3)
        this.barrier2 = new Barrier(0, (this.height / 100) * 97, this.width, (this.height / 100) * 3)
        this.puck1 = new Puck(width / 50, height / 10, 79, 76, (width / 50) * 49, (height / 20) * 9, 60)
        this.puck2 = new Puck(width / 50, height / 10, 81, 65, 0, (height / 20) * 9, 60)
        this.ball = new Ball(height, width)
        this.barriers = [this.barrier1, this.barrier2]
        this.drawnItems = [this.puck1, this.puck2, this.ball, this.barrier1, this.barrier2]
        this.winstate = null
    }
    draw(ctx) {
        ctx.clearRect(0, 0, this.height, this.width);
        ctx.fillStyle = "#FFFFFF";
        ctx.fillRect(0, 0, this.width, this.height);
        if (this.winstate == null) {
            ctx.fillStyle = "#000000";
            for (var i = 0; i < this.drawnItems.length; i++) {
                this.drawnItems[i].draw(ctx)
            }
        } else {
            this.restart()
            ctx.fillStyle = this.winstate
            ctx.fillRect(0, 0, this.width, this.height);
        }
    }
    updateKeyPress(key) {
        this.puck1.updatePos(key, this.barriers)
        this.puck2.updatePos(key, this.barriers)
        this.restart(key)
    }
    updateBall() {
        if (this.winstate == null) {
            var condition = this.ball.updatePos(this.barriers, [this.puck1, this.puck2], 0, this.width)
            if (condition == 3) {
                condition = 0
            }
            if (condition == 4) {
                condition = 0
            }
            if (condition != 0) {
                this.winCondition(condition)
            }
        }
    }
    winCondition(condition) {
        if (condition == 1) {
            this.winstate = "#FF0000"
        } else {
            this.winstate = "#00FF00"
        }
    }
    restart(key) {
        if (key == 32 && this.winstate != null) {
            this.puck1 = new Puck(this.width / 50, this.height / 10, 79, 76, (this.width / 50) * 49, (this.height / 20) * 9, 60)
            this.puck2 = new Puck(this.width / 50, this.height / 10, 81, 65, 0, (this.height / 20) * 9, 60)
            this.ball = new Ball(this.height, this.width)
            this.drawnItems = [this.puck1, this.puck2, this.ball, this.barrier1, this.barrier2]
            this.winstate = null
        }
    }
    updatePucks() {
        this.puck1.updatePos([this.ball.x, this.ball.y], this.barriers)
        this.puck2.updatePos([this.ball.x, this.ball.y], this.barriers)
    }
}
class Ball {
    constructor(height, width) {
        this.lastHit = 0;
        this.size = 50;
        this.x = (height / 2) - (this.size / 2);
        this.y = (width / 2) - (this.size / 2);
        this.xspd = Math.floor((Math.random() * 10) - 5);
        this.yspd = Math.floor((Math.random() * 10) - 5);
        while (this.xspd >= -1 && this.xspd <= 1) {
            this.xspd = Math.floor((Math.random() * 10) - 5);
        }
        while (this.yspd >= -1 && this.yspd <= 1) {
            this.yspd = Math.floor((Math.random() * 10) - 5);
        }
    }
    draw(ctx) {
        ctx.fillStyle = "#000000";
        ctx.fillRect(this.x, this.y, this.size, this.size);
    }
    updatePos(barriers, pucks, goal1, goal2) {
        var didCollide = this.checkCollision(barriers, pucks, goal1, goal2);
        if (didCollide == 3) {
            this.yspd = this.yspd * -1
        } else if (didCollide == 2 || didCollide == 6) {
            if (this.xspd < 0) {
                this.xspd = this.xspd - 1
            } else {
                this.xspd = this.xspd + 1
            }
            this.xspd = this.xspd * -1
            if (didCollide == 2) {
                this.x = this.x + this.xspd
                this.y = this.y + this.yspd
                return 3;
            } else {
                this.x = this.x + this.xspd
                this.y = this.y + this.yspd
                return 4;
            }
        } else if (didCollide == 4) {
            return 1;
        } else if (didCollide == 5) {
            return 2;
        }
        this.x = this.x + this.xspd
        this.y = this.y + this.yspd
        return 0;
    }
    checkCollision(barriers, pucks, goal1, goal2) {
        if (this.y <= barriers[0].y + barriers[0].height) {
            return 3;
        } else if (this.y + this.size >= barriers[1].y) {
            return 3;
        } else if (this.lastHit != 1 && (this.x <= pucks[1].x + pucks[1].width && ((this.y >= pucks[1].y && this.y <= pucks[1].y + pucks[1].height) || (this.y + this.size >= pucks[1].y && this.y + this.size <= pucks[1].y + pucks[1].height)))) {
            this.lastHit = 1
            return 2;
        } else if (this.lastHit != 2 && (this.x + this.size >= pucks[0].x && ((this.y >= pucks[0].y && this.y <= pucks[0].y + pucks[0].height) || (this.y + this.size >= pucks[0].y && this.y + this.size <= pucks[0].y + pucks[0].height)))) {
            this.lastHit = 2
            return 6;
        } else if (this.x <= goal1) {
            return 4;
        } else if (this.x + this.size >= goal2) {
            return 5;
        } else {
            return 1;
        }
    }
}
main(1000, 1000)