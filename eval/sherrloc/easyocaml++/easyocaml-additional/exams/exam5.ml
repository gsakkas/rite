(*F*)
let f x =
  let y = (x (fun z -> z), x (fun z -> 0))
  in fst y (snd y)

let u = f (fun g -> g 0 > 0)  

let v = f (fun g -> if g 0 then 0 else 1) 
