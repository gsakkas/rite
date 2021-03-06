type exp = Int of int | Var of string 
       | Plus of exp * exp | Times of exp * exp
type stmt = Skip | Assign of string * exp
         | Seq of stmt * stmt 
         | If of exp * stmt * stmt
         | While of exp * stmt

type heapElement =  
    | IntEntry of (string * int)
    | HeapEntry of (string * heap)
      and heap = ((heapElement) list)

(*type heap = (string * int) list*)

let rec lookup h str =
  match h with
    [] -> [] (* ############### *)
  |hd::tl -> 
      match hd with
        IntEntry (str1,i)->if str1=str then i else lookup tl str
(* #################################################################

###############################

###################################
#############
#################
############################
###############################################
###############################################

####################################
##############
############
###########################################
###############################
########################################
#####################################
####################################
###############################################
########################################
################################################
####################################
########################

#################

####################
###################################
 *)
