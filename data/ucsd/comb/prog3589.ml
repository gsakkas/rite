
let decr x = x - 1;;

let incr x = x + 1;;

let foo = List.map [incr; decr] 9;;
