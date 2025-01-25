export const authenticateAdmin = (req, res, next) => {
  // Check if user is logged in and is an admin
  if (req.session && req.session.user) {
    if (req.session.user.type === 'admin') {
      return next(); // User is an admin, proceed to the next middleware or route
    } else {
      return res.status(403).json({ success: false, message: 'Access forbidden: Admins only' });
    }
  } else {
    // User is not logged in, redirect to login page
    return res.redirect('/admin/login');
  }
};

export const ensureAuthenticated = (req, res, next) => {
  if (!req.session.user) {
       req.session.redirectTo = req.originalUrl;
      return res.redirect('/login');
  }
  next();
};

export const authencateUser = (req, res, next) => {
  if (req.session && req.session.user) {
    req.session.redirectTo = req.originalUrl;
      next(); // User is authenticated
  } else {
      res.status(401).json({ success: false, message: 'User not authenticated' });
  }
};



