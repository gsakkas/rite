
let firstF x = x + x;;

let g firstF secondF = secondF firstF;;

let secondF x' = x' + 4;;

let x = g secondF firstF;;
