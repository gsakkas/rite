
let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let func a = match f b with | b -> (b, false) | x -> (x, true) in
     ((func f), b));;
