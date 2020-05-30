/*
 * run this in the console of 
 * the TCS Tracker website to see
 * a list of coaches and
 * the number of students per coach
 */

var coaches={};
document.querySelectorAll("td:nth-child(5)").forEach(function(el) { 
    var coach = el.innerText;
    if(coach in coaches) {
        coaches[coach]++
    } else {
        coaches[coach] = 1
    }
});
console.log(coaches);

