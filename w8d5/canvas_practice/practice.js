document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  const ctx = canvas.getContext("2d");

  // canvas.style.height = "500px";
  // canvas.style.width = "500px";

  ctx.fillStyle = 'red';
  ctx.fillRect(100, 100, 300, 100);

  ctx.beginPath();
  ctx.arc(250, 100, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = 'green';
  ctx.fill();
});
