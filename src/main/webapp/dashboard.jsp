<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Remade Admin Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        <a href="#" class="flex items-center gap-3 hover:text-blue-400"><i class="fas fa-home"></i> Home</a>
        <a href="SellerController?action=list" class="flex items-center gap-3 hover:text-blue-400">
          <i class="fas fa-users-cog"></i> Seller Management
        </a>
        <a href="#" class="flex items-center gap-3 hover:text-blue-400"><i class="fas fa-shopping-cart"></i> Order Management</a>
        <a href="#" class="flex items-center gap-3 hover:text-blue-400"><i class="fas fa-boxes"></i> Product Management</a>
    </nav>
  </aside>

  <!-- Main content -->
  <div class="flex-1 flex flex-col overflow-hidden">
    <!-- Header -->
    <header class="bg-white shadow px-6 py-4 flex justify-between items-center sticky top-0 z-10">
      <h1 class="text-xl font-semibold">Welcome, <span class="text-blue-600">Admin</span></h1>
    </header>

    <!-- Page content -->
    <main class="flex-1 overflow-y-auto p-6 space-y-6">
      <!-- Stat cards -->
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-white rounded-lg p-4 shadow flex items-center gap-4">
          <i class="fas fa-user-shield fa-2x text-emerald-500"></i>
          <div>
            <p class="text-sm text-gray-500">Active Sellers</p>
            <p class="text-xl font-bold">93</p>
          </div>
        </div>
        <div class="bg-white rounded-lg p-4 shadow flex items-center gap-4">
          <i class="fas fa-clock fa-2x text-yellow-500"></i>
          <div>
            <p class="text-sm text-gray-500">Pending Orders</p>
            <p class="text-xl font-bold">17</p>
          </div>
        </div>
        <div class="bg-white rounded-lg p-4 shadow flex items-center gap-4">
          <i class="fas fa-box-open fa-2x text-rose-500"></i>
          <div>
            <p class="text-sm text-gray-500">Low Stock Items</p>
            <p class="text-xl font-bold">8</p>
          </div>
        </div>
        <div class="bg-white rounded-lg p-4 shadow flex items-center gap-4">
          <i class="fas fa-dollar-sign fa-2x text-blue-500"></i>
          <div>
            <p class="text-sm text-gray-500">Revenue</p>
            <p class="text-xl font-bold">$9,872</p>
          </div>
        </div>
      </div>

      <!-- Chart & orders -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <!-- Chart -->
        <div class="bg-white rounded-lg shadow p-6">
          <h2 class="text-lg font-semibold mb-4">Sales Overview</h2>
          <canvas id="salesChart" class="w-full h-56"></canvas>
        </div>

      <!-- Orders Table -->
      <div class="glass-card">
        <h2 class="text-lg font-semibold mb-3">Recent Orders</h2>
        <table class="w-full text-sm">
          <thead class="uppercase text-gray-500 border-b">
            <tr><th class="py-2">Order ID</th><th>Customer</th><th>Total</th><th>Status</th></tr>
          </thead>
          <tbody>
            <tr class="border-b"><td>#4567</td><td>Alice Johnson</td><td>$243</td><td class="text-green-600">Delivered</td></tr>
            <tr class="border-b"><td>#4568</td><td>Bob Lee</td><td>$89</td><td class="text-yellow-500">Pending</td></tr>
            <tr class="border-b"><td>#4569</td><td>Chris Green</td><td>$120</td><td class="text-red-600">Cancelled</td></tr>
            <tr class="border-b"><td>#4570</td><td>Dana Wright</td><td>$450</td><td class="text-green-600">Delivered</td></tr>
            <tr class="border-b"><td>#4571</td><td>Eva Gomez</td><td>$310</td><td class="text-yellow-500">Pending</td></tr>
            <tr class="border-b"><td>#4572</td><td>Frank Miller</td><td>$78</td><td class="text-green-600">Delivered</td></tr>
            <tr class="border-b"><td>#4573</td><td>Grace Lee</td><td>$190</td><td class="text-yellow-500">Pending</td></tr>
            <tr class="border-b"><td>#4574</td><td>Harry Kim</td><td>$98</td><td class="text-green-600">Delivered</td></tr>
            <tr class="border-b"><td>#4575</td><td>Ivy Chen</td><td>$164</td><td class="text-red-600">Cancelled</td></tr>
            <tr class="border-b"><td>#4576</td><td>Jake Turner</td><td>$210</td><td class="text-green-600">Delivered</td></tr>
          </tbody>
          
        </table>
      </div>
    </div>

      <!-- Activity -->
      <div class="bg-white rounded-lg shadow p-6">
        <h2 class="text-lg font-semibold mb-4">Recent Activity</h2>
        <ul class="space-y-2 text-sm">
          <li><i class="fas fa-plus-circle text-blue-500 mr-2"></i> New seller <strong>Shopify123</strong> registered.</li>
          <li><i class="fas fa-truck text-green-500 mr-2"></i> Order #4567 has been shipped.</li>
          <li><i class="fas fa-exclamation-triangle text-yellow-500 mr-2"></i> Low stock alert on item <strong>USB-C Hub</strong>.</li>
        </ul>
      </div>
    </main>

    <!-- Footer -->
    <footer class="bg-white border-t text-center text-sm text-gray-500 py-3">
      © 2025 Admin Portal
    </footer>
  </div>
</div>

<!-- Chart init -->
<script>
  const ctx = document.getElementById('salesChart').getContext('2d');
  new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
      datasets: [{
        label: 'Sales',
        data: [120, 190, 300, 250, 400],
        borderColor: '#3b82f6',
        backgroundColor: 'rgba(59, 130, 246, 0.2)',
        tension: 0.4,
        fill: true,
      }]
    },
    options: {
      responsive: true,
      plugins: { legend: { display: false } },
      scales: {
        y: { beginAtZero: true, ticks: { stepSize: 100 } }
      }
    }
  });
</script>

</body>
</html>
