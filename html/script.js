window.addEventListener('message', (event) => {
    const data = event.data;
    const board = document.getElementById('scoreboard-wrapper');

    if (data.action === "open") {
        document.getElementById('my-id').innerText = data.myId;
        document.getElementById('my-job').innerText = data.myJob;
        document.getElementById('total-players').innerText = data.total + " / " + data.maxPlayers;
        document.getElementById('cops').innerText = data.cops;
        document.getElementById('medics').innerText = data.medics;
        
        board.classList.add('show');
    } 
    else if (data.action === "close") {
        board.classList.remove('show');
    }
});