
let compose f g x = f (g x);;

let _ = compose (+) 1;;
