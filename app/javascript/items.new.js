window.addEventListener('load',function(){
 
  const input = document.getElementById("item-price")
  let inputFee = document.getElementById("add-tax-price")
  let inputProfit = document.getElementById("profit")
  
  input.addEventListener('keyup', function(){
    let price = this.value

    let fee = price / 10
    let profit = price - fee
    
    inputFee.textContent = fee
    inputProfit.textContent = profit

  })
})

