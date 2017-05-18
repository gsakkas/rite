
let fu x b = (x, (b < (x b)));;

let fu x = (fu, (x < (fu x)));;
