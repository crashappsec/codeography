/**
 * @name Transitive crypto call
 * @description A pass computing the transitive call graph of cryptographic operations
 * @kind problem
 * @problem.severity recommendation
 * @id crashappsec/nomod/transitive
 */

import python
import semmle.python.Concepts

Function getFunctionPerformingCrypto(Cryptography::CryptographicOperation op) {
  result = op.getEnclosingCallable().getScope()
}

/** Holds if there is a call to `target` within `func`. */
predicate calls(Function func, Function target) {
  exists(PythonFunctionValue fv | fv.getScope() = target and fv.getACall().getScope() = func)
}

from Function immediateCryptoOp, Function transitiveCaller
where
  immediateCryptoOp = getFunctionPerformingCrypto(_) and
  calls+(transitiveCaller, immediateCryptoOp)
select transitiveCaller,
  "transitively calls cryptographic operation $@.", immediateCryptoOp, immediateCryptoOp.getName()
