
let fun1 x = x + x;;

let fun2 x = x + 3;;

let pipe x = fun2 x (fun1 x);;
