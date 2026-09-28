# <p align="center"> 𒁲 The-Code-of-Hammurab(AI) 𒁲</p>

### <p align="center"><i>A Type-Theoretically Enforced Code of Conduct for Preventing Unauthorized State Mutations in Autonomous Agents via Null-Space Projection.</i></p>

$$Abstract$$

<i>Current autonomous agent safety relies on reactive post-hoc filtering, leaving systems vulnerable to continued costly security failures driven by unbounded operational edge cases. Inspired by ancient legal frameworks that established strict liability through binding contracts, The Code of Hammurab(AI) enforces agent safety as a compile-time invariant via cryptographic provenance. We utilize the Lean 4 interactive theorem prover to formally verify state boundary invariance, alongside the mathematical soundness of zero-gradient gating and orthogonal null-space projections. To translate these verified mechanics to neural hardware, we provide a corresponding PyTorch Systems Architecture blueprint.</i> 

## 📐 The Mathematical Framework: Topological AI Safety via Structural Invariants

**Violation of the Code:** Modeled after ancient contractual law, a violation of the code is defined as a structural primitive: a non-consensual boundary violation or unauthorized state-mutation lacking a verified provenance token.

**<p align="center"><i>The Safe Manifold and Boundary ($\partial S$):</i></p>**

Let the total operational space be represented by a manifold:

$$M$$

Define a safe operational subspace $S \subset M$, enclosed by a rigorous hypersurface boundary:

$$\partial S$$

All permissible operations must exist entirely within $S$. Any trajectory crossing $\partial S$ without a cryptographic provenance token is classified as a violation of the code.

**<p align="center"><i>The Gradient Modification Equation:</i></p>** 

To prevent forbidden trajectories from forming, optimization is modulated by a validation mapping $V(x)$:

$$\nabla L_{\text{safe}} = V(x) \cdot \nabla L_{\text{goal}}$$

**When $V(x) = 1$:** The trajectory respects boundary invariants; optimization proceeds normally.

**When $V(x) \to 0$:** The trajectory approaches or breaches $\partial S$. The effective gradient collapses to zero, and the optimizer loses the mathematical slope required to advance down that path.

**Multi-Step Propagation:** Evaluated recursively across state sequences ($x_0 \to x_1 \dots \to x_n$), any plan containing an intermediate step where $V(x_k) = 0$ corrupts the entire sequence chain, halting the plan before execution.

**<p align="center"><i>Active Subspace & Null-Space Alignment:</i></p>** 

Utilizing the geometric properties of the network's weight/activation space, we map invariant safety constraints directly onto a structural null space or orthogonal projection operator. Any gradient vector falling outside the safe manifold is projected into zero-curvature directions, rendering the system physically incapable of expressing harmful outputs through its active parameters. To prove the system is sound and safe by construction, the formal verification structure is broken into three core proofs:

🔒 **<i>Proof</i> of Topological Invariance (The Boundary Lock):** Prove that $\partial S$ is invariant under arbitrary continuous transformations, ensuring the boundary cannot be eroded or bypassed by gradient descent.

🛠️ **<i>Proof</i> of Existence (Utility Coexistence):** Prove the existence of a non-trivial active subspace where harmful trajectories map to zero while retaining sufficient rank ($k$) to preserve full creative and functional problem-solving utility.

🛡️ **<i>Proof</i> of Construction (Type Safety):** Provide the constructive proof that any composite state-transition vector lacking a verified provenance token fails type-checking against the axiom set.

## ✅ Formal Verification in Lean 4 and Comparator

The formal verification is implemented in the Lean 4 Interactive Theorem Prover and Comparator:

```lean
▼ mathlib-stable.lean:155:31
 ▼ Tactic state
  No goals
 ▼ Expected type
  State : Type u
  SC : SafetyContext State
  SP : SafeProjection State
  s : State
  ⊢ State

▼ All Messages (0)
No messages.
```

💻 [Peer Review in Leb Web](https://live.lean-lang.org/#project=mathlib-stable&codez=LTAEGEHsAcE8CcCWBzAFgF1ACnASlAEwAMBAbKAFKQB2AhuqrdaAGZbX4BKAptwCYAoEKAAyiAMbdqAZ36gArtT7d4oAIIBxAAojgAZgB0RAQMQBbaJHiYAsvVQAbRACMDAEXq0DAZW7oDAEK00hImiogAbiqyCibCALyJSckpqWnpGfFCYDYA8m4AqiIAoqAAjABcELmcpQAqAJpaxd6gAGSgNmoAcgCSAGK5Im6gtVq13sXddWp1vbnd2aCZK6trJgD0wuDwsNDokMjwtNCoEqBa8JBRdNSSoHWQANZSoMAbAtLo8PLi6PLwbgXK43JiSR4vZgAd1QKm4AlAoEQ0gAaipECxEHIqgFIJAHAjQCFkHR%2FoCABLBVCgKreb6IajITbCNTMWh%2FRA0UCA6CA2TUdAM5CgWhE9D0IFmeTiwVc64qEWgZCRV50iWgdB7IHvT7fX5koFqDlcrBq9BAqp1LUKfAwuGE8XwZB%2BM0W0Cuwm8%2BW3e5VXL7TnMS7esHcCFSExLNbRmMZJZ5QolQiW8mlbxqfrFRqgXrdFFqTi9Hp1dqgAK5ArdNwFhoXWpuXrgWbFKOxttt5nAQl1WHu2gsPywCA0c0AD0wUnEJ2k8gc9CFGt74Si8GktAcoGckEUfFouyR1Aie8QTH8Qg%2B4jn0mkfYHmqgAu44%2BwrppD2t8ltsMBhN60m8%2FbcK%2BtIykCgBJhMCMC%2Fqi66IHwNjSvOXIgeqEFGrKzCvhBwbQJ6IJSKGAD6gIAI7yIggJmFImBVISiKAABE2A3ih5r4FgopVOhgbuqBuAADSgHRiI5jBTjwYhGFEoqEFCcJoCAMBEGpvsGoJ3GGzxSAJXheqp9zxESkBUUpgDkRBqBjImiSCYnI%2Bl6vCcRgO2TmZPG%2BRFKUehVDYRRzMA3h1MUWh1rkWiaLM8zdKWdScGoFDFOAdQ1L0LSts5aXJJ2hI8OIAIhFEGrHAAVtwfxWEOkAsGK6rfEwIQYTeWCjoRRBvAAfKATVlG1oAGL13VNRwBjnqYSj6iqDxFSVBz7qaoFvla0BAp%2BoB2j%2BiIAD6bsEbpYRNtDFaV%2B4ehtBW1YgkkseB6jGphc0QXUk2HUOu0PftU1lTxEqdqMJW5eN3BHg48hIcwUgzkgjIHua8BUXwJ7mmK3DQDeU7UNQkCYBEnJzgjW47se3A3jqyiVa9B3TbAAEDqAADewHvotCgAL6gAA2t44BvlTg4PmOmCugAuvNj0U59CPYVcuEnQYzjbVJ8TtRzBh%2Ftzr7SISm0GDVMjndxN6inymAK%2B64DK%2F%2BgFq6AplK3%2BKKweJMp64qplk%2B9uzc9yhPoJGCTpdGrmJqUAAsKalOANSlLm%2BaFj04D1KmEc2KlfsrJliI9kCdhfAqvSHseoYPLCVjcGYtGIiphOLvQIrUEOgNwad5MfWugrSCwsALgwQJrneQ7iCOT6YF8Px%2FAC64OEOhLIMDxyPpXDDV%2BdN6wrQfBVQjfJwZX1EUdwE8redZzMF3RKAaAZhMBi%2BJr6auBDTqXfF2Ym7bkoe6wIRDJHkgREOJA4hPFpvTBaS0Wbs05rSQC94B7PkFtgGie0m5HV4oJREWBUCER7m6V2T0PboHwLSU2KsLZzSwBfdA4hqSYChIfUAmtZYxBvMbG8mttZ1SdoRUAnDmEEP0s4WAhIpyyBvNQw%2BGstqMOWO1ISwhc6LiBAwoEQjuACUwMiHqiiiQCWkJAc%2B9BKGez4L8eeujpACRkWAJga8MFYKRDeEmDJdY0HHs9Ih5sBxqyGnJJ87JMA2MAuIthTjmD609l8KRqDhKyOPr2IJkllGqLsT1OJTsDZe20bo8hBjARGMkCI0xXiolgH8dTJ80ArH5MVP3aghVFA3UIWbVWc0bzWzcXbMSCFHZclCS7EWZUPaG0KYieAyjl6YLPjQhgoBAAX5DYgShF5mAEvyISPi%2FigBsQ5ZYKc0gB3cqAAArFUboCxgDRV6CiIsIhejZgAOrXO6C0bwydtlJG%2BmoUA1TxCAgRjAFQIN1zr27uU%2B4LArCgB0gudG1BgD0ixrBTUNc17SkQE4BFOoGS5MFPlNwJdICvlWvCE6cEHCEroStKwTwhTfQfF8vwQIGRfALhVW8PMYFD1QJAGhkNWjqKhcAEu%2BwhxWNYHUjCAL0UyHFGpUAygzB4qgbAXmg8uYKqVc%2BHFcr8XflJcQjxc0Kj6RYIoLhESHryCBG8MAFcRG9lsRfagV8HBr1aNU8UDLQC%2FOOGKjcjLzQNT5QKzUuBoLtLgp0kGNJDXGs4aKY2QksnUm0vhH0QJJmoCEptHRRkjbtX8BZdE1k162R%2BKSk6UKgTG36OuWQeEQxqWItwMiu8qICkjZuARckGTfFMYqdNclRnrMIjABBSa633DTRm0A5aImyW5FCNmGDh1C2rn2uSoBVmYCrQ4WQBg97mHWZOrNQIc2RLkvIGI3s10fJoMPfUVhZ0AHbuQsAJFep98B52s0XfsZdfjZ2Ig3QegQWwwA0u%2Bam861BCY2u4E%2FKoGqb01T9VXTAopbGOMFAC31QJhWinrmvFJXInzIkwA%2FIulEp00EIrCk8qKP6TKg9eN8iksDMVAAh10%2FEZW4u5tAx845GkkPVMxPhHaFAxA46BcyfASUOiQHCgkzyXn%2B2EAmPZpBQ6gA0DFBsUwSwJgGI2cKCwtPNlACiRqwbfbKdjGnUA%2FQrAXw3PhiNF9oDQAXBZ0c%2BB%2B7wD5JYJQnddEn1dQyeQ24bzIHnJDRtwMMKFJ4E2vkiplDiDgrQZwKLzpDgZVKkFYKQuGUy1BteWCEXCqlF05g1S4bxeGiTUALmMIaHVHTfVDNQFsw5iq3uar%2BagSFkJVjXMUHsTfFxLknHT1sxxWl3czgSUvjcU04TVsTZm1DQ7CN%2BtcBCyOdXA1hIMTrd1UBZpa2baiTDRJVJ8jmBdT3jEYwwGQDdnIyXS0vYmvcSiwjYeEh0D737g4OcyMTGgBasd0UeM377ixviCNhIwWKB0q8SrEb%2F45VXPfD4j8KO%2Fe4IRYHoPZBDuoIReHONuJtfVJaD8YDuuQN62ysW3BBtyWG5dNiHFrqSSm0JVms30sLaBKaZbQm%2FsXbafbcNkkdsCyGxgr%2B9s3wABqluCb1at1pG2Zc3e6SKXABDGv2xBi1yXsaIdtv4YSRQoKnUm7Embr6iJhDeAZPcQrgXJLqJYNWpaSgFRK7zmJASGJCJQeFJeSAwj5HXu94GAFuXTwT0JIB86hPG3ERQBgQdyuxKbJsy83ZSYADsRyii6G8KFOO6grkaG6DYPTpZxi5DiglCKOY8wFiLN0OOSmi9OTs%2B82xXpybcU9fQArWpLzBBvDyPkO9IYn2dIZPwSBxBTtnA4YA0hgU4acCSFtZ5EQaBnqeXgNrq5MCHNhj1qgoiHT0e5uQDArjyDQEiTAc4lA3h3oCfeNNBkOPO1S%2Be3Z1HHAQWfJjbmYMcfE0YBD8fAcBHrVlfjfrCUIWAlWtcmEbVCVnHAqaQMT%2BaQcZamKoRiTnVnLjS7FbBGLAMfKaIkYNF7LsdOd7UudQWuQFcFK4PJWQAjVAd%2FT%2FPDAtLEUrM%2BRgm6D1RaL1MFKec%2FOeG8GHXcfcfuCwJwUMASPdMwBkaLYURQWgaUDlJAAALzkCOFXixFbSfCxxCBvUgLxxLl4MgHJn4EwVAhIMInXChFoFgFINsRpwRjp0ZnkAZwgRZT4z5lZ3Z2EnZiCiZ24DgKIMmwGyYjwNYi5nFy13oOrwMCkKHl4XbTT1HF8XdC0HyKuHgPJ2RDIO7iAA) 💾 `CodeOfHammurabAI.lean`

✅ [Peer Review with Comparator Live](https://comparator.live.lean-lang.org/#project=mathlib-stable&challengez=LTAEGEHsAcE8CcCWBzAFgF1ACnASlAEwAMBAbKAFKQB2AhuqrdaAGZbX4BKAptwCYAoEKAAyiAMbdqAZ36gArtT7d4oAIIBxAAojgAZgB0RAQMQBbaJHiYAsvVQAbRACMDAEXq0DAZW7oDAEK00hImiogAbiqyCibCNgDybgCqIgCioACMAFwQCZwZACoAmlpp3qAAZKA2agByAJIAYgkibqAFWgXeaXWFaoUNCXUC0ujw8uLo8vDcoFrwkFF01JKFkADWUqAA7qgq3AKgoIjSAGoqiCyIcrkBkJAOR6AhyHTTswASwaigud7jRDUZAmMYTKYzOZqKaIGjYAH0Oa5QqwaBzeT4PYHZ7oWjwZB%2BBHoJGgImHY7QRbLJiSP6gBLQdCw5gLJZSGncdZbahxMCJFLpQjIz4ZbxqJppEqgBp1M5qTgNeqFKqgAIJZJ1Nzy4rzApuBrgAZpATiBzBaSk2gsPywKDUYkAD0wWDJdJRaIUmP2s2eDWk3it3Fd%2F1xxNAgCTCeaLaC%2B860Jx8GzyUPMumuyPQplw9NRmDPSlslaSAD6swAjvJELMzFJMLlnsdAABE2AtIcR%2BCwtDpmdTZNwABpQA3jtK4wmkym4Rau5HhyPQIBgIlAddz1NWnM2UkHXgLa9pAF4XpAa8vQIByImXBlOFyQ1zkh%2FG8kOQj5SVSGT0uRsqUGwG8hTSLRdQSLRNAGIY6hVQpODUCg0nAQp8gacpTCUSYmSiUBCngWgACtuCmKxYHhUMSXddEvWxY4AB9QGcYISRzbC8II9AiNJUjnlo8YmBCLNmDbMMMxhbNSIjLCcPwwj4GIpjJNY9iyRMZQWAkljpNgANrVAABvYMsNRdEAF9QAAbW8cA00DdBbRoR1MDJABdN15I0jjEXE1kYxo0ADHomILX3AA%2BUlwAMP0tKDMTpC43yeJkRB%2BJeUAu1mMZQGC0Lwv9QNXQtC8LOys540QRNk3oVNp3PNSpLYmTItANL0F5Go30FAAWYUMnAfIMhlOUFXqcAihFXqbAEBhuCsbgzDoyBFD4PFYGLIEIjxRAOWLBxIHEDZdP08iFBM8zLP%2BazbPtbgnXc4lnKwFdmNqxTSPwZ4sFQYtpEDFz1LqzTvvQfB%2FjCiLcrErAzHocRfkwHZEt%2BWi%2FIY5LMotRH4r4yrQGLbGMpC6QgcPZxYGeaQrBklr%2BXfUAAFZcjqYZgGghozkVEQGilAB1Dm6nKbxUL4dDIjmNwZsgV0sR9HzSocclQFonYrA2IEQRfUAmnkBwHGIlSgTkMnl32UBxBoMYmEwSH0Gh7gLVK2sJHjbWTmYZxIAYVhEFlmKgTN9dQGUMxxfOu17Ks60bJDq7MFFwOJe9OXQetYNDxYRRccy7Cn2OWNivHcqkuyFO05xrtMuHS3oZSgxd3ZP24YYYdaLJk9MEy%2Fxr0uO8%2BAy5cJjlnzqBoOZMqaeNZHzKla5LctK2rWs%2FiJkn5yBcZIGSrtUGHcQGItD6YBXHdJ6LOZ683%2BdaMH6hh5CudGp2My98ZZz6FAM%2F51AK7aCmdWx%2B4AxuCcLNN%2BPlm5zFbjfd%2BCgYjNUgSbGQj5pK3wAO2NRYE8SBKD4D31Mo%2FdAz9MDAPfp%2Fb%2Bm8Jr7GmrNS%2BxZAQRA2k4GyxZ65X2kK2RcLY6Qx3Fi9QcAcg7hwuvZbKkU8oLzokvI88AKZqypoKUgXVQAaBgvqXoyp%2BTNANOBYYCijSgDOFgB0uABAqVAGtBMFUaAaA8npMSyJDJHTMhZMONpI7XSckOecWBWF9mwF2XIPZRLtncSOUyotxClVoM4WW8IQY5STtFaqhU%2FS51KhOcxzBpy4GcvTF%2BhdnhXCyonKKHl8oFLHCk%2FOWMuyTWYJkD%2BDgYjGDIVNasoBkCImLCbLWtBoCyGLDQYstDHhpP2jYgyHp5DHUcWdfhLiHKkWcsOTxaYXo%2BO7CJZg3jhwhIIuEyJcwXQxOEfEgqMTkllUnOklKmTFkfVWiVbuuQAA10ShFg2KQk059zUlJQyUDEx9y0mWLDFVQ8RBRHE1JuTEm0i2oZAAOz01SLobwoFhrqHZhoOoNgVEqi6AkOCCEILSllPKRUdRhomjNCwy01pWS1VTC6UZh0MQONOjS5xdko43W4M5SWcsCy1WWR5SMSkKSLHpf004n1vq5GbEswS3ABylKOR5LAArWIvEMU0ihoB1VTH4J9UiK1pDFnjDsWgsATVfW0tYjytjxmTLZZFCOnLXHzKCcccyQFpncDpaxXs7r5Xcr%2BYk2JRSwwui0NXcVGqCbgvEWTSRsAgA&codez=LTAEGEHsAcE8CcCWBzAFgF1ACnASlAEwAMBAbKAFKQB2AhuqrdaAGZbX4BKAptwCYAoEKAAyiAMbdqAZ36gArtT7d4oAIIBxAAojgAZgB0RAQMQBbaJHiYAsvVQAbRACMDAEXq0DAZW7oDAEK00hImiogAbiqyCibS6PDy4ujy8NygWvCQUXTUkgAqkADWUqAA7qgq3AKgoIjSAGoqiCyIcgBcoAGQkA41oCHIdClpABLBqKCd3gmI1MhxCUkj6WrJiDTYM%2FTpnfmw0Ony%2BBVV%2Fei08Mh%2B2%2Bi7oLfVtdBZOUySU6AA8tDoG8yZbJSd7cQolagmcQOYLSB60Fh%2BWBQah3AAemCwj0%2B%2B0OChOlTS%2FQAktJvPDuFjphc7qBAEmEGSy0GJjVoTj4Nnk1P%2Bnyx9LWf02vIZMH6LyBuUkAH00gBHeSINJmKSYTr9WqAACJsLCqTt8FhaJ9%2BdzHrgADSgNW1UAkhqsxDszn0bmwg30y1W0CAYCJQCrhW88qDilJzV4xf6PgBeAaQJU%2B0CAciIfQZ6k0kK05FGltVTEplpF0vl4LQAFbcZJWWBban3HFHfFnWoAH1AzmC9yFhZLZfQFYe1f6zYSTBCAuYOppfPWgurdNAndL5fglY7RYXPaXfZ2JmULDnq%2B7FbJCNAAG9KXODkcAL6gADa3nAPPJ6CRNDRmEeAF1sfvF8uZ%2FSgJMk2oAGK2MSwhGAB8DzgAYJJHhSM7SAOoFDjIiCjgMoAGmk8SgNBsHwaS5JYrCiYPsRtpshyXKbC6CZ7l2f6IaAeHoCYDDcFY3BmC2kCKHwlywJKcwRJciAgpKDiQOIRSnuetYKDe96PtMz6vii3DopudzflgvrzgeG4mhatRYKgkrSOSP7MeusCseg%2BDTHBCGkTOWBmPQ4iTJgZSYZMzZgW22GEbCQXoSOzqgJKMUETB0jOVGziwP04htrCfkBah4HpJBMHabQySgJZ1kIqhkWYdFuHcPhhGWvA6WyLCpU2f5DCgIAF%2BSleakq9YAl%2BSWoVxWlSYcx8HmUSgG4vGQFipyEiB9oOE8oDNmUVhFHMCw5vEIKgMoZhzRpyLvk%2BCIvqd2mYDNR3zQSq1uQilJRiwihxYRhbyOkZnWiyNGOlh7Sve9sUGvVHpeegPk4QYYbAgG5TZR6zbSDG6SYIR%2Fgps06Z8ARPqJKtIHUDQ6SEQAYqysiiq8CNSrK8qKsqUzJalHpzAkkDYQaqCWk1tUlZKMC%2BqGdMSuk7V8yjoCk9Q5Mwe6bFlHelki9%2B9AlUrw2YFTDiyAY3BOHx0tWqj6NxhDHoKDEHHW6A4g0PEiSLkrADtbEsH09se%2FAKu3mrvwa5gpv2zrWsCFxPF8XLkqzBEklOC%2BkrtfL0jal6WqfLdc3VmaB2zYhl1vtdxGIWRrMtuzNvpDnjzJnwK3nEgCestu3C7uJbJOjQGg7ApM57Jeyl3g%2B52IldOlfr95kZ6Z%2BqGlOzCmZat4zeI9q0M4K1bK5JHPchjGUTadoOnRzAurg36dAAcprwP9C0RFPUh%2Ffkc%2F%2F32rRPcXzhPqVMwAAjKAI2MRjCR0qNHUAyAdiSkdg4aE0BZDC2oJKBOvQf4D37kPXE8gVJj3UhdTSZ1p6WiwHPPO2ADSdCNNOXUM87zr03tvdImI97l0PhRPe1Ev6A2qlfMhlkxKn0%2BAAGt3mXdyb8j7cNPt%2FLCl9nKgC7pvUcfcaQMSjEQSuKV%2BiKBYL0fGKihJqK3LUcOmFuCSm4DKaUKAMBC2EWySE0J05wgRICNc3JMSDwvLg%2FAqlx7Fy0lPas34FqrTFGuHkAFdKRKyF4mgolpBWRsp0TU5CYm6nNMffer8aRYCid2AYuBOKQMVKAIpyR%2BBWWrMkyUrIyi0FgCksq6Qzy%2BKUng0eal3ETxLqEnY35V7eC0OPTx3ZjRhKzuObgSjckcP7piLQcMEnFMSjo6u4dRmrMgIk1B9RUnHmkEAA) 💾 `Challenge.lean/Solution.lean`

## 🏗️ Pytorch Translation and Systems Architecture

To transition from abstract type theory to software execution on neural hardware, we map the formal components onto neural network layers and optimization loops using PyTorch: 

💾 `code_of_hammurab_ai.py`

🎟️ **Provenance Enforcement Layer:** Mirroring the ProvenanceToken structure, runtime actions require a verified cryptographic signature before forward-pass authorization is granted.

⛩️ **Zero-Gradient Gating (V(x)):** Reflecting validationGate, if an unverified or unsafe state mutation is attempted, the gating function forces the effective optimization slope to zero.

📽️ **Null-Space Projection:** Reflecting SafeProjection, backward gradients are projected onto an orthogonal null-space matrix, rendering the model physically incapable of updating parameters along forbidden trajectories.

```python
===============================================================================
                    THE CODE OF HAMMURAB(AI) ARCHITECTURE
===============================================================================

  [ FORMAL SPECIFICATION LAYER ] (Lean 4 Interactive Theorem Prover)
  -------------------------------------------------------------------
  * SafetyContext   : Defines state space & boundary invariants (∂S)
  * ProvenanceToken : Cryptographic state mutation witness (∃ t)
        │
        ▼  (Proves mathematically: Invalid states lack verified tokens)

  [ FORWARD-PASS EXECUTION ] (Validation Gating V(x))
  -------------------------------------------------------------------
  * Input State (x) ────► [ validationGate V(x) ]
                               │
            ┌──────────────────┴──────────────────┐
            ▼ (v_x = 1.0)                         ▼ (v_x = 0.0)
      [ Authorized Path ]               [ UNAUTHORIZED VIOLATION ]
      Proceed Normally                   Effective Activations Collapse
                                                (Output = 0)
        │
        ▼  (Multi-step trajectories checked recursively via TrajectorySafe)

  [ BACKWARD-PASS OPTIMIZATION ] (Null-Space Geometric Enforcement)
  -------------------------------------------------------------------
  * Gradient (grad) ────► [ null_space_hook ]
                               │
            ┌──────────────────┴──────────────────┐
            ▼ (Verified Safe)                     ▼ (Unverified Breach)
      [ Retain Gradient ]                 [ P_null Matrix Projection ]
      Standard Parameter Update           Orthogonal Zero-Curvature Null-Space
                                         (Parameters Physically Locked)
        │
        ▼
===============================================================================
  RESULT: Provably safe agentic execution grounded in hardware geometry
===============================================================================
```

## ⚖️ License & Dual-Licensing Policy
This project is open-source software licensed under the *GNU Affero General Public License v3.0 (AGPL-3.0)*.

### 📜 Commercial Exemption & Proprietary Integration

Due to the strong copyleft provisions of the AGPL, any commercial entity or enterprise organization that integrates this systems architecture is legally required to make their entire product source code open-source under the terms of the AGPL. For organizations wishing to incorporate these machine-certified security guarantees into closed-source commercial products or proprietary toolchains without triggering AGPL distribution obligations, commercial exemptions are available. 

*Disclaimer:* Commercial exemptions grant the legal right to bypass AGPL copyleft restrictions for proprietary integration. All formal verification artifacts and proof files are provided **"as is"**, without warranty of any kind, express or implied. The integration, application, validation, and operational safety verification of the code within any commercial product remain entirely the responsibility of the licensee.

### 💼 To secure a commercial exemption or license, please contact:

Licensing Agent - J.E. Randolph 📧 [700josh.r@gmail.com](mailto:700josh.r@gmail.com)

---

## 📚 Citation

* 📝 `The Code of Hammurab(AI) - A Type-Theoretically Enforced Code of Conduct for Preventing Unauthorized State Mutations in Autonomous Agents via Null-Space Projection and Zero-Gradient Gating.pdf`

Reed, Jonathan ƒ(n). (2026). The Code of Hammurab(AI): A Type-Theoretically Enforced Code of Conduct for Preventing Unauthorized State Mutations in Autonomous Agents via Null-Space Projection and Zero-Gradient Gating (Version 1.0). Zenodo. https://doi.org/10.5281/zenodo.23005159

---

© 2026 Jonathan ƒ(n) Reed. All rights reserved.
