let calculation = localStorage.getItem("calculation") || "";

displayCalulation();

function updateCalculation(value) {
  calculation += value;
  displayCalulation();
  saveCalculation();
}

function saveCalculation() {
  localStorage.setItem("calculation", calculation);
}

function displayCalulation() {
  document.querySelector(".js-cal-display").innerHTML = calculation;
}