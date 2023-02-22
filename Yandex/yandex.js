var ysdk;
// var leaderboard;
var player;


function initSDK(callback) {
    YaGames.init().then(_ysdk =>{
        ysdk = _ysdk
        callback(true);
    }).catch(() =>{
        callback(false);
    });
}

function getPlayer(callback) {
    ysdk.getPlayer().then(_player =>{
        player = _player
        callback(player);
    })
}

function getMode(callback) {
    callback(player.getMode());
}

function setData(callback, datatoset) {
    console.log(JSON.parse(datatoset))
    player.setData(JSON.parse(datatoset)).then(_callback => {
        callback(_callback);
    });
}

function getData(callback) {
    player.getData().then(_callback => {
        callback(JSON.stringify(_callback));
    })
}

// function getLeaderboard() {
//     ysdk.getLeaderboards().then(_leaderboard => {
//         leaderboard = _leaderboard
//     })
// }