<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Seller Management</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/c74c0a731a.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-800">

<div class="flex h-screen">
  <!-- Sidebar -->
  <aside class="w-64 bg-slate-900 text-white flex flex-col">
    <div class="h-16 flex items-center justify-center text-2xl font-bold tracking-wide bg-slate-800">
      Dashboard
    </div>
    <nav class="flex-1 px-6 py-8 space-y-6 text-base">
      <a href="dashboard.jsp" class="flex items-center gap-3 hover:text-blue-400"><i class="fas fa-home"></i> Home</a>
      <a href="#" class="flex items-center gap-3 text-blue-400 font-semibold"><i class="fas fa-users-cog"></i> Seller Management</a>
      <a href="#" class="flex items-center gap-3 hover:text-blue-400"><i class="fas fa-shopping-cart"></i> Order Management</a>
      <a href="#" class="flex items-center gap-3 hover:text-blue-400"><i class="fas fa-boxes"></i> Product Management</a>
    </nav>
  </aside>

  <!-- Main content -->
  <div class="flex-1 flex flex-col overflow-hidden">
    <!-- Header -->
    <header class="bg-white shadow px-6 py-4 flex justify-between items-center sticky top-0 z-10">
      <h1 class="text-xl font-semibold">Seller Management</h1>
    </header>

    <!-- Page content -->
    <main class="flex-1 overflow-y-auto p-6 space-y-6">
      <!-- Add Seller Button -->
      <div class="flex justify-end">
        <a href="SellerController?action=new" 
           class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded shadow flex items-center gap-2 transition">
          <i class="fas fa-plus"></i> Add Seller
        </a>
      </div>

      <!-- Sellers Table -->
      <div class="bg-white/80 backdrop-blur-md rounded-xl shadow p-6 overflow-x-auto">
        <h2 class="text-xl font-semibold mb-4 text-slate-800">All Sellers</h2>
        <table class="min-w-full text-sm border-separate border-spacing-y-2">
          <thead class="text-gray-500 uppercase text-xs">
            <tr>
              <th class="text-left px-4 py-2">ID</th>
              <th class="text-left px-4 py-2">Name</th>
              <th class="text-left px-4 py-2">Email</th>
              <th class="text-left px-4 py-2">Phone</th>
              <th class="text-left px-4 py-2">Status</th>
              <th class="text-left px-4 py-2">Actions</th>
            </tr>
          </thead>
          <tbody>
           <c:forEach var="seller" items="${listSellers}">
			  <tr class="bg-white shadow-sm rounded-lg hover:bg-slate-50 transition-all">
			    <td class="px-4 py-3 rounded-l-lg font-semibold">${seller.id}</td>
			    <td class="px-4 py-3">${seller.name}</td>
			    <td class="px-4 py-3">${seller.email}</td>
			    <td class="px-4 py-3">${seller.phone}</td>
			    
			    <c:choose>
			      <c:when test="${seller.status == 'Active'}">
			        <td class="px-4 py-3 text-green-600 font-medium">${seller.status}</td>
			      </c:when>
			      <c:otherwise>
			        <td class="px-4 py-3 text-yellow-500 font-medium">${seller.status}</td>
			      </c:otherwise>
			    </c:choose>
			
			    <td class="px-4 py-3 rounded-r-lg">
			      <a href="SellerController?action=edit&id=${seller.id}" class="text-blue-600 hover:underline mr-3">
			        <i class="fas fa-edit"></i> Edit
			      </a>
			      <a href="SellerController?action=delete&id=${seller.id}" 
			         onclick="return confirm('Are you sure you want to delete this seller?')" 
			         class="text-red-500 hover:underline">
			        <i class="fas fa-trash"></i> Delete
			      </a>
			    </td>
			  </tr>
			</c:forEach>
           
            <c:if test="${empty listSellers}">
              <tr>
                <td colspan="6" class="text-center py-4 text-gray-500">No sellers found.</td>
              </tr>
            </c:if>
          </tbody>
        </table>
      </div>
    </main>

    <!-- Footer -->
    <footer class="bg-white border-t text-center text-sm text-gray-500 py-3">
      © 2025 Admin Portal
    </footer>
  </div>
</div>

</body>
</html>
