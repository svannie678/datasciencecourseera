## R Programming: Week 3, Assignment 2 
## The overall purpose of this assignment is to use our knowledge of functions and lexical scoping

## The overall purpose of this function is to  "create a special "matrix" object
##that can cache its inverse"

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL #initialization
  set <- function(y){  #defining variables within the parent enviornment
    x <<- y
    inverse <<- NULL
  }
  get <- function() x #anonymous function
  setinverse <- function(solve) inverse <<- solve
  getinverse <- function() inverse
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) #creating a new list with all relevant variables
}


## The overall purpose of this function is to compute the inverse of matrix defined above. If inverse 
##has already been created, then it solves for it

cacheSolve <- function(x, ...) {
      inverse <- x$getinverse() #creates a new column within matrix 
      if(!is.null(inverse)) {   #checkes to see if inverse has already been created 
        message("getting cached data")
        return(inverse)
      }
      data <- x$get()   #if not then solves for inverse and returns it 
      inverse <- solve(data,...)
      x <- setinverse(inverse)
      inverse
}

