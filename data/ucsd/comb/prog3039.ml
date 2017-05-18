
let y f g x = f (g x);;

let foo = (fun x  -> x + 1) y (fun z  -> 2 * z);;
