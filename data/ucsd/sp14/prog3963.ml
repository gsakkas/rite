
let decr x = x - 1;;

let incr x = x + 1;;

let foo = (List.map incr [9]) :: (List.map decr [10]);;
