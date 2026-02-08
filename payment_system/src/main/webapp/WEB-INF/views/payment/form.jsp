<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .payment-form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            margin-top: 40px;
            margin-bottom: 40px;
        }
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 8px;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 2px solid #e9ecef;
            transition: all 0.3s;
        }
        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        .btn {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }
        .btn-primary {
            background: #0d6efd;
            border: none;
        }
        .btn-primary:hover {
            background: #0b5ed7;
            transform: translateY(-1px);
        }
        .btn-secondary {
            background: #6c757d;
            border: none;
        }
        .btn-secondary:hover {
            background: #5c636a;
        }
        .card-icon {
            color: #0d6efd;
            margin-right: 8px;
        }
        .form-header {
            border-bottom: 2px solid #e9ecef;
            margin-bottom: 30px;
            padding-bottom: 20px;
        }
        .error { 
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 4px;
        }
        .input-group-text {
            background: #e9ecef;
            border: 2px solid #e9ecef;
            border-right: none;
        }
        .input-group .form-control {
            border-left: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="payment-form">
                    <div class="form-header">
                        <h2 class="text-center">
                            <i class="fas fa-credit-card card-icon"></i>Payment Details
                        </h2>
                    </div>
                    
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    
                    <form action="${pageContext.request.contextPath}/payment" method="post" class="needs-validation" novalidate>
                        <div class="mb-4">
                            <label for="customerName" class="form-label">
                                <i class="fas fa-user me-2"></i>Customer Name
                            </label>
                            <input type="text" class="form-control" id="customerName" name="customerName" 
                                   minlength="2" maxlength="50" required>
                            <div class="invalid-feedback">Please enter a valid customer name (2-50 characters)</div>
                        </div>
                        
                        <div class="mb-4">
                            <label for="mobileNumber" class="form-label">
                                <i class="fas fa-phone me-2"></i>Mobile Number
                            </label>
                            <div class="input-group">
                                <span class="input-group-text">+94</span>
                                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" 
                                       pattern="[0-9]{10}" required>
                            </div>
                            <div class="invalid-feedback">Please enter a valid 10-digit mobile number</div>
                        </div>
                        
                        <div class="mb-4">
                            <label for="email" class="form-label">
                                <i class="fas fa-envelope me-2"></i>Email
                            </label>
                            <input type="email" class="form-control" id="email" name="email" required>
                            <div class="invalid-feedback">Please enter a valid email address</div>
                        </div>
                        
                        <div class="mb-4">
                            <label for="cardNumber" class="form-label">
                                <i class="fas fa-credit-card me-2"></i>Card Number
                            </label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" 
                                   pattern="[0-9]{16}" required>
                            <div class="invalid-feedback">Please enter a valid 16-digit card number</div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <label for="cvv" class="form-label">
                                    <i class="fas fa-lock me-2"></i>CVV
                                </label>
                                <input type="text" class="form-control" id="cvv" name="cvv" 
                                       pattern="[0-9]{3}" required>
                                <div class="invalid-feedback">Please enter a valid 3-digit CVV</div>
                            </div>
                            
                            <div class="col-md-6 mb-4">
                                <label for="expiryDate" class="form-label">
                                    <i class="fas fa-calendar me-2"></i>Expiry Date
                                </label>
                                <input type="text" class="form-control" id="expiryDate" name="expiryDate" 
                                       pattern="(0[1-9]|1[0-2])/[0-9]{2}" placeholder="MM/YY" required>
                                <div class="invalid-feedback">Please enter expiry date in MM/YY format (e.g., 12/25)</div>
                            </div>
                        </div>
                        
                        <div class="mb-4">
                            <label for="amount" class="form-label">
                                <i class="fas fa-dollar-sign me-2"></i>Amount
                            </label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="number" class="form-control" id="amount" name="amount" 
                                       step="0.01" min="0.01" required>
                            </div>
                            <div class="invalid-feedback">Please enter a valid amount (greater than 0)</div>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                            <a href="${pageContext.request.contextPath}/payment" class="btn btn-secondary me-md-2">
                                <i class="fas fa-times me-2"></i>Cancel
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-check me-2"></i>Submit Payment
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Enhanced client-side validation
        (function () {
            'use strict'
            
            const forms = document.querySelectorAll('.needs-validation')
            
            // Function to validate expiry date
            function validateExpiryDate(input) {
                if (!input.value) return false;
                
                const [month, year] = input.value.split('/').map(num => parseInt(num, 10));
                const now = new Date();
                const currentYear = now.getFullYear() % 100;
                const currentMonth = now.getMonth() + 1;
                
                if (year < currentYear || (year === currentYear && month < currentMonth)) {
                    input.setCustomValidity('Card has expired');
                    return false;
                }
                
                input.setCustomValidity('');
                return true;
            }
            
            // Add input event listeners for real-time validation
            document.getElementById('expiryDate').addEventListener('input', function(e) {
                validateExpiryDate(this);
            });
            
            document.getElementById('cardNumber').addEventListener('input', function(e) {
                this.value = this.value.replace(/\D/g, '').substring(0, 16);
            });
            
            document.getElementById('cvv').addEventListener('input', function(e) {
                this.value = this.value.replace(/\D/g, '').substring(0, 3);
            });
            
            document.getElementById('mobileNumber').addEventListener('input', function(e) {
                this.value = this.value.replace(/\D/g, '').substring(0, 10);
            });
            
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity() || !validateExpiryDate(form.querySelector('#expiryDate'))) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
