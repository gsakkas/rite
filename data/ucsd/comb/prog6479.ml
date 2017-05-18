
let rec helper (f,b) =
  let (x,y) = f b in match x with | b -> (x, (x = b)) | _ -> helper (f, x);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;
