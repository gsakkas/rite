
let g x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let f b = let g' = g b in (b, (b = g'));;

let _ =
  let whilesFun f' b' = let fOfB = f' b' in (b', (b' = fOfB)) in whilesFun f;;
