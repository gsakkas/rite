
let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile
    ((fun x  -> let xi = f x in (xi, (((f xi) != xi) || (f (f xi))))), b);;

let _ =
  let g x = truncate (1e6 *. (cos (1e-6 *. (float x)))) in fixpoint (g, 0);;
