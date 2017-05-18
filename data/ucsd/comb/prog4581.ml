
let rec wwhile (f,b) = match f with | (x,true ) -> f x | (x,false ) -> x;;
