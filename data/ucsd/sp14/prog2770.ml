
let f y z x = y z;;

let rec chain fs =
  match fs with | [] -> (fun x  -> x) | f::fs' -> (fun x  -> f (chain fs' x));;

let ans = chain [(fun x  -> x * x; (fun x  -> 16 * x; (fun x  -> x + 1)))] 1;;
