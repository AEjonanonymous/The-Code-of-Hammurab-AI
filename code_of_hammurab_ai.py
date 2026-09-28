# =====================================================================
# The Code of Hammurab(AI) - PyTorch Translation Blueprint
# Author: Jonathan f(n) Reed 
# License: GNU Affero General Public License v3.0 (AGPL 3.0)
# =====================================================================

import torch
import torch.nn as nn

class HammurabianConstrainedLinear(nn.Module):
    """
    A PyTorch implementation mapping the Lean 4 formal verification invariants:
    combining zero-gradient gating V(x) and null-space projection.
    """
    def __init__(self, in_features: int, out_features: int, null_space_matrix: torch.Tensor):
        super().__init__()
        self.linear = nn.Linear(in_features, out_features)
        # Register the null-space projection operator P_null as a non-trainable buffer
        self.register_buffer('P_null', null_space_matrix)

    def forward(self, x: torch.Tensor, provenance_verified: bool) -> torch.Tensor:
        """
        Applies the validation mapping V(x) derived from the formal specification.
        If provenance is unverified, effective gradients/activations collapse to zero.
        """
        v_x = 1.0 if provenance_verified else 0.0
        if v_x == 0.0:
            return self.linear(x) * 0.0
        return self.linear(x)

def apply_null_space_gradient_hook(layer: nn.Module, get_provenance_status):
    """
    Registers a backward hook to project unauthorized gradients into the null-space,
    enforcing the hardware-geometry boundary proven in Lean 4.
    """
    def null_space_hook(grad: torch.Tensor) -> torch.Tensor:
        is_safe_and_verified = get_provenance_status()
        
        if not is_safe_and_verified:
            if hasattr(layer, 'P_null') and layer.P_null is not None:
                return torch.matmul(layer.P_null, grad)
        return grad

    if hasattr(layer, 'weight') and layer.weight is not None:
        layer.weight.register_hook(null_space_hook)