const donateButton = document.querySelector(".donate-button");
const fundNo = document.querySelector(".fund-no").innerText;
console.log(fundNo);

donateButton.addEventListener("click", () => {
     $.ajax({
        url: "/lively/fund/donate",
        type: "POST",
        data: {
            fundNo: fundNo
        },
        success: (data) => {
            console.log(data);
        },
        error: (error) => {
            console.log(fundNo); 
            console.log(error); 
        }
    });   
});
