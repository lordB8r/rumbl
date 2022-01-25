import Player from "./player"

let Video = {
    init(socket, element){ if(!element){return}
        console.log(socket)
        let playerId = element.getAttribute("data-player-id")
        let videoId  = element.getAttribute("data-id")
        socket.connect()
        Player.init(element.id, playerId, () => {
            console.log("Player ready 1")
            this.onReady(videoId, socket)
        })
    },
    onReady(videoId, socket){
        let msgContainer = document.getElementById("msg.container")
        let msgInput = document.getElementById("mst-input")
        let postButton = document.getElementById("msg-submit")
        let vidChannel = socket.channel("videos:" + videoId)
        //TODO join the vidChannel
    }
}
export default Video