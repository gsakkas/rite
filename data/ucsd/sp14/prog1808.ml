
let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile ((fun xx  -> (xx, ((f xx) != xx))), b);;

let g x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let _ = fixpoint (g, 0.5);;
