
let a x = x + x;;

let test f g x = f (f g);;

let x x' = x' + 3;;

let _ = test a x;;
