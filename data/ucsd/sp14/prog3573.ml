
let firstF x = x + x;;

let g firstF secondF = secondF firstF;;

let _ = g 3 firstF 3;;
