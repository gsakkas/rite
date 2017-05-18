
let fixpointHelper f b =
  let c = f b in if c = b then (c, true) else (c, false);;

let fixpointHelper f b =
  let c = f b in if c = b then (c, true) else fixpointHelper (f c);;
