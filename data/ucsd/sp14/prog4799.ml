
let o f g x = f (g x);;

let foo = (fun x  -> x + 1) o (fun y  -> 2 * y);;
