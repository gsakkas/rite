
let fun1 x = x + x;;

let fun2 x = x + 3;;

let pipe x y = y x;;

let _ = pipe fun1 fun2 3;;
