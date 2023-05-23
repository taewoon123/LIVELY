const tag = document.querySelector(".tag");
const tagText = tag.value;
tag.addEventListener("keydown",(event) => {
    if(event.keyCode == 32){
        /*tag.innerHTML = "#" + tagText;*/
    	tagText.prepend("#");
    	console.log(tag);
    }
});