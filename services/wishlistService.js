import connect from "../db/connect.js";

export const getWishlistData = async (req) => {
    if (req.session.user) {
        const userId = req.session.user.id;
        try {
            const [whislistData] = await connect.execute(
                'SELECT * FROM alfa_whislist WHERE user_id = ?',
                [userId]
            );
            return { whislistData, wishlistCount: whislistData.length };
        } catch (err) {
            console.error(err);
            return { whislistData: [], wishlistCount: 0 };
        }
    } else {
        const whislistData = req.session.cart || [];
        return { whislistData, wishlistCount: whislistData.length };
    }
};
