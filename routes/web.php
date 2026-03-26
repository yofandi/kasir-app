<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Apps\RoleController;
use App\Http\Controllers\Apps\UserController;
use App\Http\Controllers\Apps\ProductController;
use App\Http\Controllers\Apps\CategoryController;
use App\Http\Controllers\Apps\CustomerController;
use App\Http\Controllers\Apps\DashboardController;
use App\Http\Controllers\Apps\PermissionController;
use App\Http\Controllers\Apps\TransactionController;
// Import controller lain jika Anda menggunakannya, contoh:
// use App\Http\Controllers\Apps\CategoryController;
// use App\Http\Controllers\Apps\ProductController;

// Route untuk halaman login, hanya untuk guest
Route::middleware('guest')->group(function () {
    Route::get('/', function () {
        return Inertia::render('Auth/Login');
    })->name('login');
});

// Route group dengan prefix 'apps' dan middleware 'auth'
// Semua rute di dalam grup ini akan memiliki prefix '/apps'
Route::prefix('apps')->middleware('auth')->group(function () {
    Route::group(['middleware' => ['auth']], function () {
        // Dashboard
        Route::get('/dashboard', DashboardController::class)->name('apps.dashboard');

        //route permissions
        Route::get('/permissions', PermissionController::class)->name('apps.permissions.index')
            ->middleware('permission:permissions.index');

        //route resource roles
        Route::resource('/roles', RoleController::class, ['as' => 'apps'])
            ->middleware('permission:roles.index|roles.create|roles.edit|roles.delete');

        //route resource users
        Route::resource('/users', UserController::class, ['as' => 'apps'])
            ->middleware('permission:users.index|users.create|users.edit|users.delete');

        //route resource categories
        Route::resource('/categories', CategoryController::class, ['as' => 'apps'])
            ->middleware('permission:categories.index|categories.create|categories.edit|categories.delete');

        //route resource products
        Route::resource('/products', ProductController::class, ['as' => 'apps'])
            ->middleware('permission:products.index|products.create|products.edit|products.delete');

        //route resource customers
        Route::resource('/customers', CustomerController::class, ['as' => 'apps'])
            ->middleware('permission:customers.index|customers.create|customers.edit|customers.delete');

        //route transaction
        Route::get('/transactions', [TransactionController::class, 'index'])->name('apps.transactions.index');

        //route transaction searchProduct
        Route::post('/transactions/searchProduct', [TransactionController::class, 'searchProduct'])->name('apps.transactions.searchProduct');

        //route transaction addToCart
        Route::post('/transactions/addToCart', [TransactionController::class, 'addToCart'])->name('apps.transactions.addToCart');

        //route transaction destroyCart
        Route::post('/transactions/destroyCart', [TransactionController::class, 'destroyCart'])->name('apps.transactions.destroyCart');

        //route transaction store
        Route::post('/transactions/store', [TransactionController::class, 'store'])->name('apps.transactions.store');

        //route transaction print
        Route::get('/transactions/print', [TransactionController::class, 'print'])->name('apps.transactions.print');

        //route sales index
        Route::get('/sales', [\App\Http\Controllers\Apps\SaleController::class, 'index'])->middleware('permission:sales.index')->name('apps.sales.index');

        //route sales filter
        Route::get('/sales/filter', [\App\Http\Controllers\Apps\SaleController::class, 'filter'])->name('apps.sales.filter');

        //route sales export
        Route::get('/sales/export', [\App\Http\Controllers\Apps\SaleController::class, 'export'])->name('apps.sales.export');

        //route sales print pdf
        Route::get('/sales/pdf', [\App\Http\Controllers\Apps\SaleController::class, 'pdf'])->name('apps.sales.pdf');

        //route profits index
        Route::get('/profits', [\App\Http\Controllers\Apps\ProfitController::class, 'index'])->middleware('permission:profits.index')->name('apps.profits.index');

        //route profits filter
        Route::get('/profits/filter', [\App\Http\Controllers\Apps\ProfitController::class, 'filter'])->name('apps.profits.filter');

        //route profits export
        Route::get('/profits/export', [\App\Http\Controllers\Apps\ProfitController::class, 'export'])->name('apps.profits.export');

        //route profits pdf
        Route::get('/profits/pdf', [\App\Http\Controllers\Apps\ProfitController::class, 'pdf'])->name('apps.profits.pdf');
        // // Tambahan route index resource
        // Route::get('/categories', function () {
        //     return Inertia::render('CalendarView');
        // })->name('categories.index');

        // Route::get('/customers', function () {
        //     return Inertia::render('ProfileView');
        // })->name('customers.index');

        // Route::get('/products', function () {
        //     return Inertia::render('FormElementsView');
        // })->name('products.index');

        // Route::get('/permissions', function () {
        //     return Inertia::render('FormLayoutView');
        // })->name('permissions.index');

        // Route::get('/roles', function () {
        //     return Inertia::render('TablesView');
        // })->name('roles.index');

        // Route::get('/users', function () {
        //     return Inertia::render('SettingsView');
        // })->name('users.index');

        // Route::get('/transactions', function () {
        //     return Inertia::render('BasicChartView');
        // })->name('transactions.index');

        // Route::get('/profits', function () {
        //     return Inertia::render('AlertsView');
        // })->name('profits.index');

        // Route::get('/sales', function () {
        //     return Inertia::render('AlertsView');
        // })->name('sales.index');
    });

    // Autentikasi (Catatan: ini akan berada di bawah prefix '/apps')
    // Jika Anda ingin rute login/register berada di luar area /apps dan tidak memerlukan autentikasi,
    // maka rute ini harus ditempatkan di luar grup 'apps'.
    // Ini mungkin untuk halaman masuk/daftar yang hanya bisa diakses setelah login atau khusus admin.
    Route::get('/auth/signin', function () {
        return Inertia::render('Auth/SignIn'); // Nama komponen Inertia yang disarankan
    })->name('auth.signin');

    Route::get('/auth/signup', function () {
        return Inertia::render('Auth/SignUp'); // Nama komponen Inertia yang disarankan
    })->name('auth.signup');

    // Tambahkan route lain di sini sesuai kebutuhan Anda
    // Misalnya untuk kategori, produk, customer, transaksi, laporan sales, laporan profits, roles, permissions, users
    // Anda perlu membuat atau mengimpor Controller yang sesuai untuk setiap rute ini.
    // Contoh:
    // Route::resource('/categories', CategoryController::class)->names('categories');
    // Route::resource('/products', ProductController::class)->names('products');
    // Route::resource('/customers', CustomerController::class)->names('customers');
    // Route::resource('/transactions', TransactionController::class)->names('transactions');
    // Route::resource('/sales', SalesReportController::class)->names('sales');
    // Route::resource('/profits', ProfitReportController::class)->names('profits');
    // Route::resource('/roles', RoleController::class)->names('roles');
    // Route::resource('/permissions', PermissionController::class)->names('permissions');
    // Route::resource('/users', UserController::class)->names('users');
});
