
let rec wwhile (f,b) =
  match f b with | (b',true ) -> f b' | (b',false ) -> b';;
