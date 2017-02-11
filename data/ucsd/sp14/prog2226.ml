
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile
    (let g y x =
       let sec s fi m = if s = fi then (s, (s = (m s))) else (s, false) in
       sec (y x) x in
     ((g f b), b));;
