let paymentAmount = 0;

window.addEventListener("message", function(event){
    if(event.data.action === "openPaymentUI"){
        paymentAmount = event.data.amount || 0;
        document.getElementById("payText").innerText = "Montant à payer : " + paymentAmount + " $";
        document.body.style.display = "flex";
    }
});

document.getElementById("payCash").addEventListener("click", function(){
    fetch(`https://${GetParentResourceName()}/payCash`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ amount: paymentAmount })
    });
    document.body.style.display = "none";
});

document.getElementById("payCard").addEventListener("click", function(){
    fetch(`https://${GetParentResourceName()}/payCard`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ amount: paymentAmount })
    });
    document.body.style.display = "none";
});

document.getElementById("cancel").addEventListener("click", function(){
    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: "POST",
        headers: { "Content-Type": "application/json" }
    });
    document.body.style.display = "none";
});