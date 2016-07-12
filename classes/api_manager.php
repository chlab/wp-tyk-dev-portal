<?php
/**
 * Tyk API manager
 *
 * @package Tyk_Dev_Portal\Tyk_API
 */

/**
 * Handles API management, not actual API communication
 */
class Tyk_API_Manager 
{
	/**
	 * Name of tag that a policy must have on tyk api
	 * so users may register for it freely
	 */
	const POLICY_TAG = 'allow_registration';

	/**
	 * Get available APIs defined on Tyk
	 * 
	 * @return array
	 */
	public static function available_apis() {
		$tyk = new Tyk_API();
		// available apis are actually available policies/plans that allow access
		// to certain apis under certain restrictions
		$response = $tyk->get('/portal/policies');
		// a generator would be nice here but alas, php 5.4 is still very common
		$active_apis = array();
		if (is_object($response) && isset($response->Data)) {
			foreach ($response->Data as $policy) {
				// only return active apis
				if ($policy->active && !$policy->is_inactive) {
					if (isset($policy->tags) && is_array($policy->tags) && in_array(self::POLICY_TAG, $policy->tags))
					$active_apis[] = array(
						'id' => $policy->_id,
						'name' => $policy->name,
						);
				}
			}
		}

		return $active_apis;
	}

	/**
	 * Register a developer for a tyk API
	 * 
	 * @param Portal_User $user
	 * @param string $policy
	 * @return string The key
	 */
	public function register_for_api(Tyk_Portal_User $user, $policy) {
		$key_request = $this->make_key_request($user, $policy);
		if (is_string($key_request)) {
			return $this->approve_key_request($key_request);
		}
	}

	/**
	 * Make a key request for a tyk api plan/policy
	 *
	 * @param Portal_User $user
	 * @param string $policy
	 * @return string
	 */
	protected function make_key_request(Tyk_Portal_User $user, $policy) {
		$tyk = new Tyk_API();
		$key = $tyk->post('/portal/requests', array(
			'by_user' => $user->get_tyk_id(),
			'for_plan' => $policy,
			// it's possible to have key requests approved manually
			'approved' => TYK_AUTO_APPROVE_KEY_REQUESTS,
			// this is a bit absurd but tyk api doesn't set this by itself
			'date_created' => date('c'),
			));
		return $key;
	}

	/**
	 * Approve a key request
	 * 
	 * Unfortunately, tyk api doesn't support making and approving a key
	 * request in the same request, so this method must be invoked after
	 * issuing {@link this::make_key_request()}.
	 *
	 * @throws Exception When we don't get a token bac from API
	 * 
	 * @return string Actual access token
	 */
	protected function approve_key_request($key) {
		$tyk = new Tyk_API();
		$token = $tyk->put('/portal/requests/approve', $key);
		if (is_object($token) && isset($token->RawKey)) {
			return $token->RawKey;
		}
		else {
			throw new Exception('Could not register for API');
		}
	}
}