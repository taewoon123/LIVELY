function chat(){

	let options = "width=500, height=600, top=100,left=500";
    window.open("/lively/chat", "chat", options);

}

const search_button = document.querySelector(".feed_search_input");
search_button.addEventListener("keydown",(event) => {
    if(event.keyCode == 13){
        event.preventDefault();
        document.querySelector('.hidden_button').click();
    }
});