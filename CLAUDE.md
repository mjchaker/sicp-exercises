# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a collection of exercise solutions from the book "Structure and Interpretation of Computer Programs" (SICP). The exercises are implemented in Scheme and are compatible with MIT/GNU Scheme.

**Attribution Note:** Some solutions or parts of solutions may incorporate ideas, approaches, or code from various educational sources including textbooks, online resources, and community discussions. This is a learning repository that combines original work with established educational material.

## Development Commands

### Running Scheme Code
```bash
# Run individual exercise files with MIT/GNU Scheme (preferred)
mit-scheme --load filename.scm

# Alternative: Run with Racket (legacy support)
racket filename.scm

# For interactive development
mit-scheme  # Start REPL, then use (load "filename.scm")
```

### Testing Individual Exercises
```bash
# Test specific exercise with MIT/GNU Scheme
mit-scheme --load 1-11.scm

# For exercises with timing analysis (like prime testing)
mit-scheme --load 1-22.scm  # Includes timing measurements

# Text-based exercises (.txt files) contain theoretical answers
cat 1-5.txt  # View applicative vs normal-order evaluation analysis
```

## Code Architecture

### File Organization Pattern
- **Exercise solutions**: `chapter-exercise.scm` (e.g., `1-11.scm`, `1-22.scm`)
- **Theoretical answers**: `chapter-exercise.txt` for non-computational exercises
- **Reusable algorithms**: Standalone implementations like `pascal.scm`

### Code Structure Patterns

**Dual Implementation Strategy**: Most exercises demonstrate both recursive and iterative approaches:
- Recursive procedures often generate iterative processes using state variables
- Helper functions follow `function-name-iter` naming convention
- State evolution clearly defined with accumulator parameters

**Mathematical Algorithm Focus**: 
- Prime testing with optimization techniques (1-21.scm, 1-22.scm)
- Numerical methods like Newton's method for roots (1-7.scm, 1-8.scm)
- Fast arithmetic operations using logarithmic algorithms (1-16.scm through 1-18.scm)

**Evaluation Trace Documentation**:
- Step-by-step evaluation traces in comments show computational process
- Demonstrates applicative-order vs normal-order evaluation differences
- Performance analysis with actual timing measurements

### Key Implementation Patterns

**Iterative Process Template**:
```scheme
(define (function-iter state1 state2 counter)
  (if (termination-condition?)
      result
      (function-iter (update-state1) (update-state2) (update-counter))))
```

**Helper Function Organization**:
```scheme
(define (main-function n)
  (define (helper-iter ...)  ; iterative version
    ...)
  (define (helper-recursive ...)  ; recursive version  
    ...)
  (helper-iter initial-values))
```

**Performance Testing Pattern**:
```scheme
(define (timed-test n)
  (start-prime-test n (runtime)))
```

## Exercise Categories

- **Process Types**: Recursive vs iterative process analysis (1-11.scm)
- **Numerical Methods**: Root finding, approximation algorithms (1-7.scm, 1-8.scm)
- **Algorithm Optimization**: Fast exponentiation, multiplication (1-16.scm through 1-18.scm)
- **Mathematical Analysis**: Prime testing, GCD, number theory (1-20.scm through 1-22.scm)
- **Evaluation Strategies**: Order of evaluation impact on computation (1-5.txt, 1-6.txt)