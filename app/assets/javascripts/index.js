function send(message, classOfDiv) {
    let input = document.getElementById("inputChat").value;
    let mainContainer = document.getElementsByClassName("main")[0];
    let request = document.createElement("div");
    request.className = classOfDiv;
    request.innerText = message.join("'");
    mainContainer.append(request);
    let scrollHeight = mainContainer.scrollHeight;
    mainContainer.scrollTop = scrollHeight + 100;
    document.getElementById("inputChat").value = "";
}

function showInput() {
    let message = $("#inputChat").val().split("'");
    send(message, "request");
}