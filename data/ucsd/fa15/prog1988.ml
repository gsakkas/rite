
let helper (f,b) =
  let x = f b in match b with | x -> (x, (x != b)) | _ -> (x, true);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;
