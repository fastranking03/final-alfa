
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


export const authenticateAdmin = (req, res, next) => {
  if (req.session && req.session.user) {
    // Check if the user is an admin
    if (req.session.user.type === 'admin') {
      next(); 
    } else {
      res.status(403).json({ success: false, message: 'Access forbidden: Admins only' });
    }
  } else {
    return res.redirect('/admin/login');
  }
};
