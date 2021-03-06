<!-- Header & imports -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="../../includes/headerlogout.inc" %>
<!-- End header -->

<!-- Container -->
<div class="container min-vh-100">
    <!-- Row -->
    <div class="row">
        <!-- Section -->
        <section class="col-12">

            <!-- Counters -->
            <div class="container d-flex justify-content-center my-5">

                <div class="col rounded-lg shadow px-3 py-3 text-center">
                    <h4 class="text-primary">Antal forespørgsler</h4> <br>
                    <h3><span class="badge badge-primary">${fn:length(requestScope.userProposition)}</span></h3>
                </div>
                <div class="col rounded-lg shadow mx-5 px-3 py-3 text-center">
                    <h4 class="text-primary">Klokken er nu</h4> <br>
                    <h3><span class="badge badge-primary" id="time"></span></h3>
                </div>
                <div class="col rounded-lg shadow px-3 py-3 text-center">
                    <h4 class="text-primary">Brugernavn</h4> <br>
                    <h3><span class="badge badge-primary">${sessionScope.email}</span></h3>
                </div>

            </div>
            <!-- End counters -->

            <div class="container my-5">
                <!-- Table over customer quotes -->
                <table class="table table-striped" id="myTable">
                    <thead>
                    <tr>
                        <th scope="col">Kunde id:</th>
                        <th scope="col">Navn:</th>
                        <th scope="col">Adresse:</th>
                        <th scope="col">Postnummer:</th>
                        <th scope="col">Telefon:</th>
                        <th scope="col">Email:</th>
                        <th scope="col">Bemærkning:</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="view" items="${requestScope.userProposition}">
                        <tr>
                            <th scope="row">${view.user_proposition_id}</th>
                            <td>${view.name}</td>
                            <td>${view.address}</td>
                            <td>${view.zipcodeCity}</td>
                            <td>${view.phone}</td>
                            <td>${view.email}</td>
                            <td>${view.comments}</td>
                            <td>
                                <!-- User overview button -->
                                <form class="form-group" name="viewQuote" action="FrontController"
                                      method="post">
                                    <input type="hidden" name="target" value="quoteView">
                                    <input type="hidden" name="orderID" value="${view.orders_id}">
                                    <input type="hidden" name="viewID" value="${view.user_proposition_id}">
                                    <input type="submit" class="btn btn-success text-white" value="Åben">
                                </form>
                                <!-- End user overview button -->
                            </td>
                            <td>
                                <!-- Delete user proposition -->
                                <form class="form-group" name="deleteQuote" action="FrontController"
                                      method="post">
                                    <input type="hidden" name="target" value="adminRejectQuote">
                                    <input type="hidden" name="quoteID" value="${view.user_proposition_id}">
                                    <input type="submit" class="btn btn-warning text-white" value="Fjern"
                                           onclick="return confirm('Er du sikker på at du vil slette?')"/>
                                </form>
                                <!-- End delete user proposition button -->
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- End table over customer quotes -->
            </div>


            <!-- If Fog wants to be able to make other employee users we have made room for it -->
            <!-- ALL CODE/SETUP IS READY FOR USE -->
            <!-- Create employee
            <div class="container d-flex justify-content-center my-5">

                <div class="col-4 p-5 rounded-lg shadow">
                    <h3 class="text-primary text-center">Opret medarbejder</h3>
                    <form name="register" action="FrontController" method="POST">
                        <input type="hidden" name="target" value="register">
                        <div class="form-group">
                            <label for="InputEmail">Email adresse</label>
                            <input type="email" class="form-control" id="InputEmail" aria-describedby="emailHelp"
                                   name="email" value="opret@mig.nu">
                            <small id="emailHelp" class="form-text text-muted">Brugernavn</small>
                        </div>
                        <div class="form-group">
                            <label for="InputPassword1">Password</label>
                            <input type="password" class="form-control" id="InputPassword1" name="password1"
                                   value="hemmelig">
                        </div>
                        <div class="form-group">
                            <label for="InputPassword2">Gentag password</label>
                            <input type="password" class="form-control" id="InputPassword2" name="password2"
                                   value="hemmelig">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Opret</button>
                    </form>
                </div>

            </div>
            End employee -->

        </section>
        <!-- End section -->
    </div>
    <!-- End row -->
</div>
<!-- End container -->

<!-- Footer -->
<%@include file="../../includes/footer.inc" %>
<!-- End footer -->

<!-- Admin layout/functions for table -->

<script>

    $(document).ready(function () {
        $('#myTable').DataTable();
    });

</script>

<!-- Realtime clock -->
<script>

    (function () {
        function checkTime(i) {
            return (i < 10) ? "0" + i : i;
        }

        function startTime() {
            var today = new Date(),
                h = checkTime(today.getHours()),
                m = checkTime(today.getMinutes()),
                s = checkTime(today.getSeconds());
            document.getElementById('time').innerHTML = h + ":" + m + ":" + s;
            t = setTimeout(function () {
                startTime()
            }, 500);
        }

        startTime();
    })();

</script>