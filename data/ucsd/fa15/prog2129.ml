
let fixpoint (f,b) =
  let gs x =
    let xx = f x in match xx with | xx when (xx - x) > 0 -> (x, b) | _ -> f x in
  wwhile (gs, b);;
