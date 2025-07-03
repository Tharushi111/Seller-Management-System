<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>
    <c:choose>
      <c:when test="${not empty seller}">Edit Seller</c:when>
      <c:otherwise>Add Seller</c:otherwise>
    </c:choose>
  </title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/c74c0a731a.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-800 flex items-center justify-center min-h-screen">

  <div class="bg-white rounded-lg shadow-lg p-8 w-full max-w-md">
    <h1 class="text-2xl font-semibold mb-6">
      <c:choose>
        <c:when test="${not empty seller}">Edit Seller</c:when>
        <c:otherwise>Add New Seller</c:otherwise>
      </c:choose>
    </h1>

    <form action="SellerController" method="post" class="space-y-4">
      <!-- Hidden inputs for edit or insert -->
      <c:choose>
        <c:when test="${not empty seller}">
          <input type="hidden" name="id" value="${seller.id}" />
          <input type="hidden" name="action" value="update" />
        </c:when>
        <c:otherwise>
          <input type="hidden" name="action" value="insert" />
        </c:otherwise>
      </c:choose>

      <div>
        <label for="name" class="block text-sm font-medium text-gray-700">Seller Name</label>
        <input
          type="text"
          id="name"
          name="name"
          required
          value="${seller.name}"
          class="w-full border border-gray-300 rounded px-3 py-2 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      <div>
        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
        <input
          type="email"
          id="email"
          name="email"
          required
          value="${seller.email}"
          class="w-full border border-gray-300 rounded px-3 py-2 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      <div>
        <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
        <input
          type="tel"
          id="phone"
          name="phone"
          required
          value="${seller.phone}"
          class="w-full border border-gray-300 rounded px-3 py-2 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      <div>
        <label for="status" class="block text-sm font-medium text-gray-700">Status</label>
        <select
          id="status"
          name="status"
          class="w-full border border-gray-300 rounded px-3 py-2 mt-1 focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="Active" <c:if test="${seller.status == 'Active'}">selected</c:if>>Active</option>
          <option value="Pending" <c:if test="${seller.status == 'Pending'}">selected</c:if>>Pending</option>
        </select>
      </div>

      <div class="flex justify-between items-center pt-4">
        <a href="SellerController?action=list" class="text-gray-600 hover:underline">&larr; Back to List</a>
        <button
          type="submit"
          class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded shadow"
        >
          <c:choose>
            <c:when test="${not empty seller}">Update Seller</c:when>
            <c:otherwise>Add Seller</c:otherwise>
          </c:choose>
        </button>
      </div>
    </form>
  </div>

</body>
</html>
