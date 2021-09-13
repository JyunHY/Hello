document.addEventListener('turbolinks:load', function(event){
    let messageBody = document.getElementById('messageBody');
    if (messageBody) {
        messageBody.scrollTop = messageBody.scrollHeight - messageBody.clientHeight;
    }
    
})