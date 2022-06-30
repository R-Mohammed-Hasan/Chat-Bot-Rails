function send(message, classOfDiv) {
    let input = document.getElementById("inputChat").value;
    if (input == "") {
        return;
    } else {
        let request = document.createElement("div");
        request.className = classOfDiv;
        request.innerText = message;
        $(".main").append(request);
        document.getElementById("inputChat").value = "";
        let scrollHeight = $(".main").scrollHeight;
        $(".main").scrollTop = scrollHeight + 100;
    }
}

$("form").onSubmit(() => {
    let input = $("#inputChat").val();
    send(input, "request");
});